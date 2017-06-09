defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller # get_session

  alias Discuss.Repo
  alias Discuss.User

  # It's ideal to do expensive computations here if needed
  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end