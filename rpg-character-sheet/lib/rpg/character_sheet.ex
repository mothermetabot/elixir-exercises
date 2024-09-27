defmodule RPG.CharacterSheet do

  @welcome_message "Welcome! Let's fill out your character sheet together."
  @character_name_prompt "What is your character's name?\n"
  @character_class_prompt "What is your character's class?\n"
  @character_level_prompt "What is your character's level?\n"

  def welcome(), do:
    @welcome_message
    |> IO.puts()

  def ask_name(), do:
    @character_name_prompt
    |> IO.gets()
    |> String.trim()

  def ask_class(), do:
    @character_class_prompt
    |> IO.gets()
    |> String.trim()

  def ask_level(), do:
    @character_level_prompt
    |> IO.gets()
    |> Integer.parse()
    |> elem(0)

  def run() do
    welcome()
    %{name: ask_name(), class: ask_class(), level: ask_level()}
    |> IO.inspect([label: "Your character"])
  end
end
