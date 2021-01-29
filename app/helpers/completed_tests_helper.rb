module CompletedTestsHelper
  def result_message(completed_test)
    test_result = completed_test.test_passed? ? 'passed' : 'failed'

    "#{test_result} > #{completed_test.test_result} - test #{test_result}".html_safe
  end
end
