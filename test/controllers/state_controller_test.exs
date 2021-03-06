defmodule StateSaver.StateControllerTest do
  use StateSaver.ConnCase
  import StateSaver.Factory

  # alias StateSaver.State
  # @valid_attrs %{hash: "some content", state: "some content"}
  # @invalid_attrs %{}

  test "#index renders a list of states" do
    conn = build_conn()
    state = insert(:state)

    conn = get conn, state_path(conn, :index)

    assert json_response(conn, 200) == %{
      "states" => [%{
        "id" => state.id,
        "state" => state.state,
        "hash" => state.hash,
        "inserted_at" => DateTime.from_naive!(state.inserted_at, "Etc/UTC") |> DateTime.to_iso8601 |> String.slice(0..-2),
        "updated_at" => DateTime.from_naive!(state.updated_at, "Etc/UTC") |> DateTime.to_iso8601 |> String.slice(0..-2)
      }]
    }
  end

  # test "renders form for new resources", %{conn: conn} do
  #   conn = get conn, state_path(conn, :new)
  #   assert html_response(conn, 200) =~ "New state"
  # end
  #
  # test "creates resource and redirects when data is valid", %{conn: conn} do
  #   conn = post conn, state_path(conn, :create), state: @valid_attrs
  #   assert redirected_to(conn) == state_path(conn, :index)
  #   assert Repo.get_by(State, @valid_attrs)
  # end
  #
  # test "does not create resource and renders errors when data is invalid", %{conn: conn} do
  #   conn = post conn, state_path(conn, :create), state: @invalid_attrs
  #   assert html_response(conn, 200) =~ "New state"
  # end
  #
  # test "shows chosen resource", %{conn: conn} do
  #   state = Repo.insert! %State{}
  #   conn = get conn, state_path(conn, :show, state)
  #   assert html_response(conn, 200) =~ "Show state"
  # end
  #
  # test "renders page not found when id is nonexistent", %{conn: conn} do
  #   assert_error_sent 404, fn ->
  #     get conn, state_path(conn, :show, -1)
  #   end
  # end
  #
  # test "renders form for editing chosen resource", %{conn: conn} do
  #   state = Repo.insert! %State{}
  #   conn = get conn, state_path(conn, :edit, state)
  #   assert html_response(conn, 200) =~ "Edit state"
  # end
  #
  # test "updates chosen resource and redirects when data is valid", %{conn: conn} do
  #   state = Repo.insert! %State{}
  #   conn = put conn, state_path(conn, :update, state), state: @valid_attrs
  #   assert redirected_to(conn) == state_path(conn, :show, state)
  #   assert Repo.get_by(State, @valid_attrs)
  # end
  #
  # test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
  #   state = Repo.insert! %State{}
  #   conn = put conn, state_path(conn, :update, state), state: @invalid_attrs
  #   assert html_response(conn, 200) =~ "Edit state"
  # end
  #
  # test "deletes chosen resource", %{conn: conn} do
  #   state = Repo.insert! %State{}
  #   conn = delete conn, state_path(conn, :delete, state)
  #   assert redirected_to(conn) == state_path(conn, :index)
  #   refute Repo.get(State, state.id)
  # end
end
