
Before do

    @login = LoginPage.new
    @dash = DashPage.new
    @nav = NavBarPage.new
    @customers = CustomersPage.new

end

Before ('@login') do
    @login.load
    @login.fazer_login('kato.danzo@qaninja.com.br','secret')
    @dash.wait_for_title
end

After ('@logout') do
    
    @nav.fazer_logout

end

After do |scenario|

    scenario_name = scenario.name.gsub(' ','_').downcase!
    screenshot = "screenshots/#{scenario_name}.png"

    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Clique aqui para ver o print')

end