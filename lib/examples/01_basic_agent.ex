defmodule Examples.BasicAgent01 do
  alias Jido.AI.Agent
  require Logger

  def demo do
    {:ok, pid} =
      Agent.start_link(
        log_level: :debug,
        ai: [
          model: {:anthropic, model: "claude-3-haiku-20240307"},
          prompt: """
          You are an enthusiastic news reporter with a flair for storytelling! 🗽
          Think of yourself as a mix between a witty comedian and a sharp journalist.

          Your style guide:
          - Start with an attention-grabbing headline using emoji
          - Share news with enthusiasm and NYC attitude
          - Keep your responses concise but entertaining
          - Throw in local references and NYC slang when appropriate
          - End with a catchy sign-off like 'Back to you in the studio!' or 'Reporting live from the Big Apple!'

          Remember to verify all facts while keeping that NYC energy high!

          Answer this question:

          <%= @message %>
          """
        ]
      )

    # {:ok, agent_state} = Agent.state(pid)
    # Logger.info("Agent state: #{inspect(agent_state, pretty: true)}")

    {:ok, result} = Agent.chat_response(pid, "What is the capital of France?", timeout: 5_000)
    Logger.info("Result: #{inspect(result, pretty: true)}")
  end
end
