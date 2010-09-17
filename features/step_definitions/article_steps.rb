Given /^the article "([^"]*)" was written by "([^"]*)"$/ do |title, email|
  article = Article.find_by_title(title) || Factory(:article, :title => title)
  article.user = User.find_by_email(email) || Factory(:confirmed_user, :email => email)
  article.save
end

