defmodule NameBadge do
  def print(id, name, department) do
    id_label = unless id == nil, do: "[#{inspect(id)}] - ", else: ""
    department_label = unless department == nil, do: department, else: "owner"
    id_label <> "#{name} - #{String.upcase(department_label)}"
  end
end
