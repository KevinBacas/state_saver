defmodule StateSaver.StateController do
  use StateSaver.Web, :controller

  alias StateSaver.State

  def index(conn, _params) do
    states = Repo.all(State)
    render(conn, "index.json", states: states)
  end

  def create(conn, %{"state" => state_params}) do
    changeset = State.changeset(%State{}, state_params)

    case Repo.insert(changeset) do
      {:ok, state} ->
        render(conn, "show.json", state: state)
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => hash}) do
    state = Repo.get_by!(State, hash: hash)
    render(conn, "show.json", state: state)
  end

  # def update(conn, %{"id" => id, "state" => state_params}) do
  #   state = Repo.get!(State, id)
  #   changeset = State.changeset(state, state_params)
  #
  #   case Repo.update(changeset) do
  #     {:ok, state} ->
  #       conn
  #       |> put_flash(:info, "State updated successfully.")
  #       |> redirect(to: state_path(conn, :show, state))
  #     {:error, changeset} ->
  #       render(conn, "edit.html", state: state, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   state = Repo.get!(State, id)
  #
  #   # Here we use delete! (with a bang) because we expect
  #   # it to always work (and if it does not, it will raise).
  #   Repo.delete!(state)
  #
  #   conn
  #   |> put_flash(:info, "State deleted successfully.")
  #   |> redirect(to: state_path(conn, :index))
  # end
end
