class BadgeService
  RULES = {
    'passing_test_on_first_try' =>       BadgeRuleSpecifications::PassingTestOnFirstTry,
    'passing_all_tests_from_category' => BadgeRuleSpecifications::PassingAllTestsFromCategory,
    'passing_all_tests_by_level' =>      BadgeRuleSpecifications::PassingAllTestsByLevel
  }.freeze

  def self.call(completed_test)
    new(completed_test).call
  end

  def initialize(completed_test)
    @completed_test = completed_test
  end

  def call
    return unless @completed_test.test_passed?

    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(@completed_test, badge.rule_value)
      add_badge(badge) if rule.satisfies?
    end
  end

  private

  def add_badge(badge)
    @completed_test.user.badges.push(badge)
  end

end