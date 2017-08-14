class UserPresenter < BasePresenter
  def role_css_class(role)
    if role == :primary_investigator
      'info'
    elsif role == :coordinator
      'warning'
    else
      'primary'
    end
  end
end
