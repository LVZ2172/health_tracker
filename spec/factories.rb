FactoryGirl.define do
  factory(:user) do
    username('batman')
    email('batman@gotham.com')
    password('brucewayne')
  end
end
