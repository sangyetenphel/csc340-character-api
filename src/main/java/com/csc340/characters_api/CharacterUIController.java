package com.csc340.characters_api;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CharacterUIController {

    private final CharacterService characterService;

    public CharacterUIController(CharacterService characterService) {
        this.characterService = characterService;
    }

    @GetMapping("/characters/search")
    public String searchCharacters(@RequestParam(required = false) String name, Model model) {
        List<Character> characters;

        if (name != null && !name.isEmpty()) {
            characters = characterService.searchCharactersByName(name);
        } else {
            characters = characterService.getAllCharacters();
        }

        model.addAttribute("characters", characters);
        return "character-list";
    }

    @GetMapping("/characters/universe/{universe}")
    public String getByUniverse(@PathVariable String universe, Model model) {
        List<Character> characters = characterService.getCharactersByUniverse(universe);
        model.addAttribute("characters", characters);
        return "character-list";
    }

    @ModelAttribute("allCharacters")
    public List<Character> allCharacters() {
        return characterService.getAllCharacters();
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/characters")
    public String getAllCharacters(Model model) {
        model.addAttribute("characters", characterService.getAllCharacters());
        System.out.println(characterService.getAllCharacters());
        return "character-list";
    }

    @GetMapping("/characters/{id}")
    public String getCharacterById(@PathVariable Long id, Model model) {

        Character character = characterService.getCharacterById(id);

        if (character != null) {
            model.addAttribute("character", characterService.getCharacterById(id));
            return "character-details";
        } else {
            return "error";
        }
    }

    @GetMapping("/create")
    public String showCreateForm() {
        return "character-create";
    }

    @PostMapping("/create")
    public String createCharacter(Character character, Model model) {

        if (character.getName() == null || character.getName().isEmpty()) {
            model.addAttribute("error", "Name is required");
            return "character-create";
        }

        characterService.createCharacter(character);
        return "redirect:/characters";
    }

    @GetMapping("/delete/{id}")
    public String deleteCharacter(@PathVariable Long id) {
        characterService.deleteCharacter(id);
        return "redirect:/characters";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Character character = characterService.getCharacterById(id);
        model.addAttribute("character", character);
        return "character-edit";
    }

    @PostMapping("/update/{id}")
    public String updateCharacter(@PathVariable Long id, @ModelAttribute Character updatedCharacter) {
        characterService.updateCharacter(id, updatedCharacter);
        return "redirect:/characters";
    }

}
