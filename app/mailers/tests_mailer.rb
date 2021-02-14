class TestsMailer < ApplicationMailer

  def completed_test(completed_test)
    @user = completed_test.user
    @test = completed_test.test

    mail to: @user.email, subject: 'You just completed the TestGuru test!'
  end

end
