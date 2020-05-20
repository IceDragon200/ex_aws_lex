defmodule ExAws.Lex.ModelBuilding do
  @moduledoc """
  TODO
  """
  @type create_bot_version_opt ::
    {:checksum, String.t()}

  @spec create_bot_version(String.t(), [create_bot_version_opt]) :: term
  def create_bot_version(name, params) do
    data = %{
      "checksum" => params[:checksum]
    }
    request(:create_bot_version, data, %{path: "/bots/#{name}/versions"})
  end

  def create_intent_version(name, params) do
    data = %{
      "checksum" => params[:checksum]
    }
    request(:create_intent_version, data, %{path: "/intents/#{name}/versions"})
  end

  def create_slot_type_version(name, params) do
    data = %{
      "checksum" => params[:checksum]
    }
    request(:create_slot_type_version, data, %{path: "/slottypes/#{name}/versions"})
  end

  def delete_bot(name) do
    opts = %{
      http_method: :delete,
      path: "/bots/#{name}"
    }
    request(:delete_bot, nil, opts)
  end

  def delete_bot_alias(bot_name, name) do
    opts = %{
      http_method: :delete,
      path: "/bots/#{bot_name}/aliases/#{name}"
    }
    request(:delete_bot_alias, nil, opts)
  end

  def delete_bot_channel_association(bot_name, alias_name, name) do
    opts = %{
      http_method: :delete,
      path: "/bots/#{bot_name}/aliases/#{alias_name}/channels/#{name}"
    }
    request(:delete_bot_channel_association, nil, opts)
  end

  def delete_bot_version(name, version) do
    opts = %{
      http_method: :delete,
      path: "/bots/#{name}/versions/#{version}"
    }
    request(:delete_bot_version, nil, opts)
  end

  def delete_intent(name) do
    opts = %{
      http_method: :delete,
      path: "/intents/#{name}"
    }
    request(:delete_intent, nil, opts)
  end

  def delete_intent_version(name, version) do
    opts = %{
      http_method: :delete,
      path: "/intents/#{name}/versions/#{version}"
    }
    request(:delete_intent_version, nil, opts)
  end

  def delete_slot_type(name) do
    opts = %{
      http_method: :delete,
      path: "/slottypes/#{name}"
    }
    request(:delete_slot_type, nil, opts)
  end

  def delete_slot_type_version(name, version) do
    opts = %{
      http_method: :delete,
      path: "/slottypes/#{name}/versions/#{version}"
    }
    request(:delete_slot_type_version, nil, opts)
  end

  def delete_utterances(bot_name, user_id) do
    opts = %{
      http_method: :delete,
      path: "/bots/#{bot_name}/utterances/#{user_id}"
    }
    request(:delete_utterances, nil, opts)
  end

  def get_bot(name, version_alias) do
    opts = %{
      http_method: :get,
      path: "/bots/#{name}/versions/#{version_alias}"
    }
    request(:get_bot, nil, opts)
  end

  def get_bot_alias(bot_name, name) do
    opts = %{
      http_method: :get,
      path: "/bots/#{bot_name}/aliases/#{name}"
    }
    request(:get_bot_alias, nil, opts)
  end

  def get_bot_aliases(bot_name, params) do
    opts = %{
      http_method: :get,
      path: "/bots/#{bot_name}/aliases",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:name_contains, value}, acc ->
          Map.put(acc, "nameContains", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_bot_aliases, nil, opts)
  end

  def get_bot_channel_association(bot_name, alias_name, name) do
    opts = %{
      http_method: :get,
      path: "/bots/#{bot_name}/aliases/#{alias_name}/channels/#{name}"
    }
    request(:get_bot_channel_association, nil, opts)
  end

  def get_bot_channel_associations(bot_name, alias_name, params) do
    opts = %{
      http_method: :get,
      path: "/bots/#{bot_name}/aliases/#{alias_name}/channels",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:name_contains, value}, acc ->
          Map.put(acc, "nameContains", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_bot_channel_associations, nil, opts)
  end

  def get_bots(params) do
    opts = %{
      http_method: :get,
      path: "/bots",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:name_contains, value}, acc ->
          Map.put(acc, "nameContains", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_bots, nil, opts)
  end

  def get_bot_versions(name) do
    opts = %{
      http_method: :get,
      path: "/bots/#{name}/versions",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_bot_versions, nil, opts)
  end

  def get_builtin_intent(signature) do
    opts = %{
      http_method: :get,
      path: "/builtin/intents/#{signature}"
    }
    request(:get_builtin_intent, nil, opts)
  end

  def get_builtin_intents(params) do
    opts = %{
      http_method: :get,
      path: "/builtin/intents",
      params: Enum.reduce(params, %{}, fn
        {:locale, value}, acc ->
          Map.put(acc, "locale", value)

        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)

        {:signature_contains, value}, acc ->
          Map.put(acc, "signatureContains", value)
      end)
    }
    request(:get_builtin_intents, nil, opts)
  end

  def get_builtin_slot_types(params) do
    opts = %{
      http_method: :get,
      path: "/builtin/slottypes",
      params: Enum.reduce(params, %{}, fn
        {:locale, value}, acc ->
          Map.put(acc, "locale", value)

        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)

        {:signature_contains, value}, acc ->
          Map.put(acc, "signatureContains", value)
      end)
    }
    request(:get_builtin_slot_types, nil, opts)
  end

  def get_export(params) do
    opts = %{
      http_method: :get,
      path: "/exports",
      params: Enum.reduce(params, %{}, fn
        {:export_type, value}, acc ->
          Map.put(acc, "exportType", value)

        {:name, value}, acc ->
          Map.put(acc, "name", value)

        {:resource_type, value}, acc ->
          Map.put(acc, "resourceType", value)

        {:version, value}, acc ->
          Map.put(acc, "version", value)
      end)
    }
    request(:get_export, nil, opts)
  end

  def get_import(import_id) do
    opts = %{
      http_method: :get,
      path: "/imports/#{import_id}",
    }
    request(:get_import, nil, opts)
  end

  def get_intent(name, version) do
    opts = %{
      http_method: :get,
      path: "/intents/#{name}/versions/#{version}",
    }
    request(:get_intent, nil, opts)
  end

  def get_intents(params) do
    opts = %{
      http_method: :get,
      path: "/intents",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:name_contains, value}, acc ->
          Map.put(acc, "nameContains", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_intents, nil, opts)
  end

  def get_intent_versions(name, params) do
    opts = %{
      http_method: :get,
      path: "/intents/#{name}/versions",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_intent_versions, nil, opts)
  end

  def get_slot_type(name, version) do
    opts = %{
      http_method: :get,
      path: "/slottypes/#{name}/versions/#{version}",
    }
    request(:get_slot_type, nil, opts)
  end

  def get_slot_types(params) do
    opts = %{
      http_method: :get,
      path: "/slottypes",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:name_contains, value}, acc ->
          Map.put(acc, "nameContains", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_slot_types, nil, opts)
  end

  def get_slot_type_versions(name, params) do
    opts = %{
      http_method: :get,
      path: "/slottypes/#{name}",
      params: Enum.reduce(params, %{}, fn
        {:max_results, value}, acc ->
          Map.put(acc, "maxResults", value)

        {:next_token, value}, acc ->
          Map.put(acc, "nextToken", value)
      end)
    }
    request(:get_slot_type_versions, nil, opts)
  end

  def get_utterances_view(bot_name, params) do
    opts = %{
      http_method: :get,
      path: "/slottypes/#{name}",
      params: Enum.reduce(params, %{"view" => "aggregation"}, fn
        {:bot_versions, value}, acc ->
          Map.put(acc, "bot_versions", value)

        {:status_type, value}, acc ->
          Map.put(acc, "status_type", value)
      end)
    }
    request(:get_utterances_view, nil, opts)
  end

  def list_tags_for_resource(resource_arn) do
    opts = %{
      http_method: :get,
      path: "/tags/#{resource_arn}"
    }
    request(:list_tags_for_resource, nil, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_PutBot.html) for data
  """
  @spec put_bot(String.t(), String.t(), map) :: term
  def put_bot(name, version, data) do
    opts = %{
      http_method: :put,
      path: "/bots/#{name}/versions/#{version}"
    }
    request(:put_bot, data, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_PutBotAlias.html) for data
  """
  @spec put_bot_alias(String.t(), String.t(), map) :: term
  def put_bot_alias(bot_name, name, data) do
    opts = %{
      http_method: :put,
      path: "/bots/#{bot_name}/aliases/#{name}"
    }
    request(:put_bot_alias, data, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_PutIntent.html) for data
  """
  @spec put_intent(String.t(), String.t(), map) :: term
  def put_intent(name, version, data) do
    opts = %{
      http_method: :put,
      path: "/intents/#{name}/versions/#{version}"
    }
    request(:put_intent, data, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_PutSlotType.html) for data
  """
  @spec put_slot_type(String.t(), String.t(), map) :: term
  def put_slot_type(name, version, data) do
    opts = %{
      http_method: :put,
      path: "/slottypes/#{name}/versions/#{version}"
    }
    request(:put_slot_type, data, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_StartImport.html) for data
  """
  @spec start_import(map) :: term
  def start_import(data) do
    opts = %{
      http_method: :post,
      path: "/imports"
    }
    request(:start_import, data, opts)
  end

  @doc """
  See (https://docs.aws.amazon.com/lex/latest/dg/API_TagResource.html) for data
  """
  @spec tag_resource(String.t(), map) :: term
  def tag_resource(resource_arn, data) do
    opts = %{
      http_method: :post,
      path: "/tags/#{resource_arn}"
    }
    request(:tag_resource, data, opts)
  end

  def untag_resource(resource_arn, tag_keys) do
    opts = %{
      http_method: :delete,
      path: "/tags/#{resource_arn}",
      params: %{
        "tagKeys" => tag_keys
      }
    }
    request(:untag_resource, nil, opts)
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
          {"content-type", "application/x-amz-json-1.0"}
        ]
      }
      |> Map.merge(opts)
    )
  end
end
