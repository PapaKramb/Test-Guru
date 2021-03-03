class BadgeService
  
  def initialize(completed_test)
    @completed_test = completed_test
    @user = completed_test.user
    @test = completed_test.test
    @current_completed_test = @user.completed_test.where(test: @test)
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def badge_unlock
    Badge.select do |badge|
      send("#{badge.rule_type}?", badge.rule_value)
    end
  end

  def first_try?(_params)
    @current_completed_test.count == 1 if @completed_test.test_passed?
  end

  def all_tests_by_category?(category_id)
    return false unless @test.category.id == category_id.to_i

    test_ids = Category.find(category_id.to_i).tests.ids
    test_ids.size == tests_passed(test_ids)
  end

  def all_tests_by_level?(level)
    return false unless @test.level == level.to_i

    test_ids = Test.where(level: level).ids
    test_ids.size == tests_passed(test_ids)
  end

  def tests_passed(test_ids)
    @user.completed_tests.where(test_id: test_ids).success.uniq.count
  end

end