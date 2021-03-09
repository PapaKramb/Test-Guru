module BadgeRuleSpecifications
  class PassingTestOnFirstTry < AbstractRuleSpecification
    def satisfies?
      test = Test.find_by(@rule_value)
      return false if @completed_test.test != test

      CompletedTest.where(test: test, user: @completed_test.user).count == 1
    end
  end
end
