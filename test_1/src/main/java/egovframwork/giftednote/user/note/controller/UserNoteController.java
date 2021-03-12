package egovframwork.giftednote.user.note.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import egovframwork.giftednote.user.note.service.UserNoteService;

@Controller
public class UserNoteController {
	
	@Autowired
	UserNoteService UserNoteService;

}
