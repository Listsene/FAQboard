package net.aird.FAQboard.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.aird.FAQboard.model.*;
import net.aird.FAQboard.dao.*;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("questionDao")
	private IDao<Question> questionDao;
	@Autowired
	@Qualifier("typeDao")
	private IDao<Type> typeDao;

	private List<Question> questions;
	private List<Integer> pages;
	private List<Type> types;
	private Question questionToEdit;
	private int pageNumber;
	private String searchString = "";
	private int typeId = 0;

	@ModelAttribute
    public void addAttributes(final Model model) {
        model.addAttribute("question", new Question());
        if(types == null) {
        	types = typeDao.list();
        }
		model.addAttribute("listType", types);
		model.addAttribute("typeId", typeId); // selected type for search/write
		model.addAttribute("searchString", searchString);
		model.addAttribute("listQuestion", questions);
		model.addAttribute("listPages", pages);
		model.addAttribute("pageNumber", pageNumber);
    }

	@GetMapping(value = "/")
	public String home(@RequestParam(name="page", defaultValue = "0") Integer page, Model model) {

		pageNumber = page;
		if(pageNumber == 0) {
			pageNumber = 1;
			searchString = "";
			typeId = 0;	
		}
		questions = (((QuestionDao) questionDao).search(searchString, typeId, pageNumber));
		pages = getPageNumbers(searchString, pageNumber, typeId);
		addAttributes(model);

		return "home";
	}

	@GetMapping(value = "/search")
	public String search(@RequestParam(name="type", defaultValue = "0") Integer selectedTypeId, @RequestParam("searchStr") String searchStr, Model model) {

		searchString = searchStr;
		pageNumber = 1;
		typeId = selectedTypeId;
		questions = ((QuestionDao) questionDao).search(searchString, typeId, pageNumber);
		pages = getPageNumbers(searchString, pageNumber, typeId);
		addAttributes(model);
		
		return "home";
	}

	@RequestMapping(value = "/saveQuestion", method = RequestMethod.POST)
	public String saveQuestion(Locale locale, @ModelAttribute("question") Question question, ModelMap model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		try {
			date = dateFormat.parse(formattedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		question.setCount(0);
		question.setDate(date);
		questionDao.update(question);
		
		questions = (((QuestionDao) questionDao).search(searchString, typeId, pageNumber));
		model.addAttribute("listQuestion", questions);
		
		pages = getPageNumbers(searchString, pageNumber, typeId);
		model.addAttribute("listPages", pages);
		
		return "home";
	}
	
	@RequestMapping(value = "/editQuestion", method = RequestMethod.POST)
	public String editQuestion(Locale locale, @ModelAttribute("viewQuestion") Question question, ModelMap model) {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);
		try {
			date = dateFormat.parse(formattedDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		questionToEdit.setTitle(question.getTitle());
		questionToEdit.setContent(question.getContent());
		questionToEdit.setAuthor(question.getAuthor());
		questionToEdit.getType().setId(question.getType().getId());
		questionToEdit.setDate(date);
		questionDao.update(questionToEdit);
		
		questions = (((QuestionDao) questionDao).search(searchString, typeId, pageNumber));
		model.addAttribute("listQuestion", questions);
		
		pages = getPageNumbers(searchString, pageNumber, typeId);
		model.addAttribute("listPages", pages);
		
		return "home";
	}
	
	@GetMapping(value = "/read")
	public String read(@RequestParam("id") int id, Model model) {

		Question question = questions.stream()
				.filter(q -> q.getId() == id)
				.findFirst()
				.get();
		question.incrementCount();
		questionDao.update(question);
		questionToEdit = question;
		model.addAttribute("viewQuestion", question);
		addAttributes(model);

		return "home";
	}
	
	/*
	 * Helper function returns list of page numbers
	 * Max 10 page numbers, firstPage, middle 8 pages, lastPage
	 * ex: 1 ... 5-12 ... maxPage
	 */
	private List<Integer> getPageNumbers(String searchStr, int pageNumber, int typeId) {
		
		int totalNumOfQuestions = ((QuestionDao) questionDao).count(searchStr, typeId);
		List<Integer> pageNumbers = new ArrayList<Integer>();
		int maxPage = (totalNumOfQuestions / IDao.LIST_MAX_RESULTS) + 1;
		int startPage = 0;
		if(pageNumber > 4) { // if current page is high, set new start page and add first page
			startPage = pageNumber - 4;
			pageNumbers.add(1);
		}
		int diff = maxPage - pageNumber;
		while(diff < 5 && maxPage > 9) { // when startPage is too close to maxPage, decrement startPage to show more pages, provided there are enough pages to show
			startPage--;
			diff++;
		}

		for (int i = startPage; i < maxPage; i++) {
			pageNumbers.add(i + 1);
			if(pageNumbers.size() == 9 && maxPage > (i + 1)) {
				pageNumbers.add(maxPage);
				break;
			}
		}
		return pageNumbers;
	}
	
	/*
	 * Helper function adds number of generated questions to db
	 */
	public void addQuestions(int num) {

		List<String> authors = Arrays.asList("개발1팀장", "재발2팀장", "연구소장", "선임연구원", "책임연구원", "팀원", "Admin", "HR");
		List<String> titles = Arrays.asList("What is a jdk?", "What are constructors?", "What is a singleton?",
				"What is a static method?", "How long will this go on?", "Have you used React?", "Have you used Vue?",
				"How to add Foreign Key?", "What is a transaction?", "What is SELECT FOR UPDATE?",
				"How to initialize a var?");
		List<Integer> types = Arrays.asList(1, 2, 3);
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		try {
			date = dateFormat.parse("2022.05.23 12:34:56");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int count = 1;
		Random rand = new Random();
		for (int i = 0; i < num; i++) {
			Type type = new Type();
			type.setId(types.get(rand.nextInt(types.size())));
			Question question = new Question(type, titles.get(rand.nextInt(titles.size())), "Sample answer",
					authors.get(rand.nextInt(authors.size())), date, count);
			questionDao.update(question);
		}

	}

}
