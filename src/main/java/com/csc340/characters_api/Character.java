package com.csc340.characters_api;

import jakarta.persistence.*;

@Entity
@Table(name = "characters")
public class Character {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long characterId;

  @Column(nullable = false)
  private String name;

  private String realName;
  private String description;

  @Column(columnDefinition = "TEXT")
  private String fullDescription;
  private String universe;
  private String role;
  private String species;
  private String powerLevel;

  @Column(columnDefinition = "TEXT")
  private String abilities;
  private String imageUrl;

  public Character() {
  }

  public Character(String name, String realName, String description, String fullDescription, String universe, String role,String species, String powerLevel, String abilities, String imageUrl) {
    this.name = name;
    this.realName = realName;
    this.description = description;
    this.fullDescription = fullDescription;
    this.universe = universe;
    this.role = role;
    this.species = species;
    this.powerLevel = powerLevel;
    this.abilities = abilities;
    this.imageUrl = imageUrl;
  }

  public Character(Long characterId, String name, String description,
                   String universe, String role, String species, String powerLevel) {
    this.characterId = characterId;
    this.name = name;
    this.description = description;
    this.universe = universe;
    this.role = role;
    this.species = species;
    this.powerLevel = powerLevel;
  }

  public Long getCharacterId() {
    return characterId;
  }

  public void setCharacterId(Long characterId) {
    this.characterId = characterId;
  }

  public String getRealName() {
    return realName;
  }

  public void setRealName(String realName) {
    this.realName = realName;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getFullDescription() {
    return fullDescription;
  }

  public void setFullDescription(String fullDescription) {
    this.fullDescription = fullDescription;
  }

  public String getUniverse() {
    return universe;
  }

  public void setUniverse(String universe) {
    this.universe = universe;
  }

  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

  public String getSpecies() {
    return species;
  }

  public void setSpecies(String species) {
    this.species = species;
  }

  public String getPowerLevel() {
    return powerLevel;
  }

  public void setPowerLevel(String powerLevel) {
    this.powerLevel = powerLevel;
  }

  public String getAbilities() {
    return abilities;
  }

  public void setAbilities(String abilities) {
    this.abilities = abilities;
  }

  public String getImageUrl() {
    return imageUrl;
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }
}