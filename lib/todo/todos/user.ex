defmodule Todo.Todos.User do
  import Ecto.Changeset
  use Ecto.Schema


schema "users" do
  field :name, :string
  field :email, :string
  field :password, :string

  timestamps(type: :utc_datetime)
end

def changeset(users, attr) do
  users
  |> cast(attr, [:name, :email, :password])
  |> validate_required([:name, :email, :password])
end
end
