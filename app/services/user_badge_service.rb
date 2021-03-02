class UserBadgeService

  def initialize(completed_test)
    @completed_test = completed_test
    @user = completed_test.user
    @test = completed_test.test
  end

  def badges_unlock
    Badge.all.select do |badge|
      @user.badges.push(badge) if send("#{badge.rule}_award?", badge.value)
    end
  end

  private

  def first_try_award?(_value)
    @user.tests.where(id: @test.id).count == 1
  end

  def all_tests_by_category_award?(category_id)
    return if category_id != @test.category_id

    test_ids = Test.by_category.where(category_id: category_id).pluck(:id)
    test_ids.uniq.sort == @user.tests_passed(test_ids)
  end

  def all_tests_by_level_award?(level)
    return if level != @test.level

    test_ids = Test.by_level.where(level: level).pluck(:id)
    test_ids.uniq.sort == @user.tests_passed(test_ids)
  end

end