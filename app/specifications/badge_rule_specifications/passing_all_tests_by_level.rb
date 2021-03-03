module BadgeRuleSpecifications
  class PassingAllTestsByLevel < AbstractRuleSpecification
    def satisfies?
      level = @rule_value
      return false if @completed_test.test.level != level

      @completed_test.user.passed_tests.where(level: level).uniq.count == Test.where(level: level).count
    end
  end
end