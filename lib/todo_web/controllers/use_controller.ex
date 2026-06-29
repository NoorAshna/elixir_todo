defmodule UserController do
use User, :controller

use Todo.Users
use Todo.Todos.User

def index(conn, _params) do
  Users.list_users()
      render(conn, :index, todos: todos)

end


end
