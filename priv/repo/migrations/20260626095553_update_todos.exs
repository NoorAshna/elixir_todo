defmodule Todo.Repo.Migrations.UpdateTodos do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :description, :string
    end
  end
end
