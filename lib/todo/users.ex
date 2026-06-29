defmodule Todo.Users do

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.Todos.User

    def list_users do
      Repo.all(User)
    end
    def add_user(attr) do
      %User{}
      |> User.changeset(attr)
      |>Repo.insert()

    end
end
