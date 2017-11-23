defmodule JapHajiWeb.VerbControllerTest do
  use JapHajiWeb.ConnCase

  alias JapHaji.API
  alias JapHaji.API.Verb

  @create_attrs %{kumi: "ichidan",   midashi: "食べる", yomi: "たべる"}
  @update_attrs %{kumi: "ichidan",   midashi: "食べる", yomi: "たべる"}
  @invalid_attrs %{kumi: nil, midashi: nil, yomi: nil}

  def fixture(:verb) do
    {:ok, verb} = API.create_verb(@create_attrs)
    verb
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all verbs", %{conn: conn} do
      conn = get conn, verb_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create verb" do
    test "renders verb when data is valid", %{conn: conn} do
      conn = post conn, verb_path(conn, :create), verb: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, verb_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "kumi" => "ichidan",
        "midashi" => "食べる",
        "yomi" => "たべる",
        "polite_present" => "食べます"
      }
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, verb_path(conn, :create), verb: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update verb" do
    setup [:create_verb]

    test "renders verb when data is valid", %{conn: conn, verb: %Verb{id: id} = verb} do
      conn = put conn, verb_path(conn, :update, verb), verb: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, verb_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "kumi" => "ichidan",
        "midashi" => "食べる",
        "yomi" => "たべる",
        "polite_present" => "食べます"
      }
    end

    test "renders errors when data is invalid", %{conn: conn, verb: verb} do
      conn = put conn, verb_path(conn, :update, verb), verb: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete verb" do
    setup [:create_verb]

    test "deletes chosen verb", %{conn: conn, verb: verb} do
      conn = delete conn, verb_path(conn, :delete, verb)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, verb_path(conn, :show, verb)
      end
    end
  end

  defp create_verb(_) do
    verb = fixture(:verb)
    {:ok, verb: verb}
  end
end
