module CompletedTestsHelper
  def result_message(completed_test)
    test_result = completed_test.test_passed? ? 'passed' : 'failed'

    "<div class=#{test_result}>#{completed_test.test_result} - test #{test_result}</div>".html_safe
  end
end
