defmodule ExAws.Lex.Runtime do
  def delete_session(bot_name, bot_alias, user_id) do
    opts = %{
      http_method: :delete,
      path: "/bot/#{bot_name}/alias/#{bot_alias}/user/#{user_id}/session"
    }
    request(:delete_session, nil, opts)
  end

  def get_session(bot_name, bot_alias, user_id, checkpoint_label_filter) do
    opts = %{
      http_method: :get,
      path: "/bot/#{bot_name}/alias/#{bot_alias}/user/#{user_id}/session",
      params: %{
        "checkpointLabelFilter" => checkpoint_label_filter,
      }
    }
    request(:get_session, nil, opts)
  end

  def post_content(_bot_name, _bot_alias, _user_id) do
    # TODO
    raise "TODO"
    #opts = %{
    #  http_method: :post,
    #  path: "/bot/#{bot_name}/alias/#{bot_alias}/user/#{user_id}/content"
    #}
    #request(:post_content)
  end

  def post_text(bot_name, bot_alias, user_id, data) do
    opts = %{
      http_method: :post,
      path: "/bot/#{bot_name}/alias/#{bot_alias}/user/#{user_id}/text"
    }
    request(:post_text, data, opts)
  end

  def put_session(bot_name, bot_alias, user_id, data) do
    opts = %{
      http_method: :post,
      path: "/bot/#{bot_name}/alias/#{bot_alias}/user/#{user_id}/session"
    }
    request(:put_session, data, opts)
  end

  defp request(op, data, opts \\ %{}) do
    operation =
      op
      |> Atom.to_string()
      |> Macro.camelize()

    ExAws.Operation.JSON.new(
      :lex,
      %{
        data: data,
        headers: [
          {"x-amz-target", "#{@namespace}.#{operation}"},
          {"accept", "application/json"},
          {"content-type", "application/x-amz-json-1.0"}
        ]
      }
      |> Map.merge(opts)
    )
  end
end
