package com.csc340.characters_api;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/characters")
public class CharacterController {

    private final CharacterService service;

    public CharacterController(CharacterService service) {
        this.service = service;
    }

    @GetMapping("/")
    public List<Character> getAllCharacters() {
        return service.getAllCharacters();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Character> getCharacterById(@PathVariable Long id) {

        Character character = service.getCharacterById(id);

        if(character != null) {
            return ResponseEntity.ok(character);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping("/")
    public Character addCharacter(@RequestBody Character character) {
        return service.addCharacter(character);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Character> updateCharacter(
            @PathVariable Long id,
            @RequestBody Character character) {

        Character updated = service.updateCharacter(id, character);

        if(updated != null) {
            return ResponseEntity.ok(updated);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCharacter(@PathVariable Long id) {

        service.deleteCharacter(id);

        return ResponseEntity.noContent().build();
    }

    @GetMapping("/category/{universe}")
    public List<Character> getCharactersByUniverse(@PathVariable String universe) {
        return service.getCharactersByUniverse(universe);
    }

    @GetMapping("/search")
    public List<Character> searchCharacters(@RequestParam String name) {
        return service.searchCharacters(name);
    }

}