class GistQuestionService

  ACCESS_TOKEN = Rails.application.credentials.github

  def initialize(question, client: Octokit::Client.new(access_token: ACCESS_TOKEN))
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.present?
  end

  private

  def gist_params
    {
      description: I18n.t('.description', title: @test.title),
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
