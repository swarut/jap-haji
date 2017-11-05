defmodule JapHajiWeb.VerbController do
  use JapHajiWeb, :controller

  alias JapHaji.API
  alias JapHaji.API.Verb

  action_fallback JapHajiWeb.FallbackController

  def index(conn, _params) do
    verbs = API.list_verbs()
    render(conn, "index.json", verbs: verbs)
  end

  def create(conn, %{"verb" => verb_params}) do
    with {:ok, %Verb{} = verb} <- API.create_verb(verb_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", verb_path(conn, :show, verb))
      |> render("show.json", verb: verb)
    end
  end

  def show(conn, %{"id" => id}) do
    verb = API.get_verb!(id)
    render(conn, "show.json", verb: verb)
  end

  def update(conn, %{"id" => id, "verb" => verb_params}) do
    verb = API.get_verb!(id)

    with {:ok, %Verb{} = verb} <- API.update_verb(verb, verb_params) do
      render(conn, "show.json", verb: verb)
    end
  end

  def delete(conn, %{"id" => id}) do
    verb = API.get_verb!(id)
    with {:ok, %Verb{}} <- API.delete_verb(verb) do
      send_resp(conn, :no_content, "")
    end
  end
end
