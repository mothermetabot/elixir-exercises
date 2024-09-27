defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name, "\n")
      |> String.trim("\t")
      |> String.trim(" ")
      |> String.first()
  end

  def initial(name) do
    cap_first_letter = first_letter(name)
      |> String.upcase()

    cap_first_letter <> "."
  end

  def initials(full_name) do
    String.split(full_name)
      |> Enum.map(fn (x) -> initial x end)
      |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do

    mk_heart = fn (a, b) -> """
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     #{a}  +  #{b}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
""" end

    mk_heart.(initials(full_name1), initials(full_name2))
  end
end
