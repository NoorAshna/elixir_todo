defmodule TodoWeb.My_TodoControllerTest do
  use TodoWeb.ConnCase

  import Todo.TodosFixtures

  @create_attrs %{title: "some title", completed: true}
  @update_attrs %{title: "some updated title", completed: false}
  @invalid_attrs %{title: nil, completed: nil}

  describe "index" do
    test "lists all todos", %{conn: conn} do
      conn = get(conn, ~p"/todos")
      assert html_response(conn, 200) =~ "Listing Todos"
    end
  end

  describe "new my__todo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/todos/new")
      assert html_response(conn, 200) =~ "New My  todo"
    end
  end

  describe "create my__todo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/todos", my__todo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/todos/#{id}"

      conn = get(conn, ~p"/todos/#{id}")
      assert html_response(conn, 200) =~ "My  todo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/todos", my__todo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New My  todo"
    end
  end

  describe "edit my__todo" do
    setup [:create_my__todo]

    test "renders form for editing chosen my__todo", %{conn: conn, my__todo: my__todo} do
      conn = get(conn, ~p"/todos/#{my__todo}/edit")
      assert html_response(conn, 200) =~ "Edit My  todo"
    end
  end

  describe "update my__todo" do
    setup [:create_my__todo]

    test "redirects when data is valid", %{conn: conn, my__todo: my__todo} do
      conn = put(conn, ~p"/todos/#{my__todo}", my__todo: @update_attrs)
      assert redirected_to(conn) == ~p"/todos/#{my__todo}"

      conn = get(conn, ~p"/todos/#{my__todo}")
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, my__todo: my__todo} do
      conn = put(conn, ~p"/todos/#{my__todo}", my__todo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit My  todo"
    end
  end

  describe "delete my__todo" do
    setup [:create_my__todo]

    test "deletes chosen my__todo", %{conn: conn, my__todo: my__todo} do
      conn = delete(conn, ~p"/todos/#{my__todo}")
      assert redirected_to(conn) == ~p"/todos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/todos/#{my__todo}")
      end
    end
  end

  defp create_my__todo(_) do
    my__todo = my__todo_fixture()

    %{my__todo: my__todo}
  end
end
