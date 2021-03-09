module BadgeRuleSpecifications
  class PassingAllTestsFromCategory < AbstractRuleSpecification
    def satisfies?
      category = Category.find(@rule_value)
      return false if @completed_test.test.category != category

      @completed_test.user.passed_tests.where(category: category).count % Test.where(category: category).count == 0
    end
  end
end
