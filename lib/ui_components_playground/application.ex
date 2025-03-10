defmodule UiComponentsPlayground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      UiComponentsPlaygroundWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:ui_components_playground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: UiComponentsPlayground.PubSub},
      # Start a worker by calling: UiComponentsPlayground.Worker.start_link(arg)
      # {UiComponentsPlayground.Worker, arg},
      # Start to serve requests, typically the last entry
      UiComponentsPlaygroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UiComponentsPlayground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    UiComponentsPlaygroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
