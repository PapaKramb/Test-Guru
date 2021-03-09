module BadgeRuleSpecifications
  class AbstractRuleSpecification
    def initialize(completed_test, rule_value)
      @completed_test = completed_test
      @rule_value = rule_value
    end

    def satisfies?
      raise "#{__method__} undefined for #{self.class}"
    end
  end
end
