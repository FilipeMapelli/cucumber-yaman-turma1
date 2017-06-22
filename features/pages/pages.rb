
class LoginPage <SitePrism::Page
    set_url '/login'

    element :email, 'input[id=email]'
    element :password, 'input[type=password]'
    element :sign_in, '.login-button'
    element :alert, '.alert-warning'

    def fazer_login(u,p)
        self.email.set u
        self.password.set p
        self.sign_in.click
    end

end

class NavBarPage <SitePrism::Page
    element :user_menu, '#navbar a[class*=dropdown]'
    element :logout_link, '#navbar a[href$=logout]'
    element :customers_link, '#navbar a[href$=customers]'

    def fazer_logout
        self.user_menu.click
        self.logout_link.click
    end
end

class DashPage <SitePrism::Page
    element :title, 'h2[id=page_title]'
end

class CustomersPage <SitePrism::Page

    set_url '/customers'

    element :new_c, '#dataview-insert-button'
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :type, 'select[id=costumer]'
    element :notes, 'textarea[name=note]'
    element :save_b, '#form-submit-button'

    element :search_field, '#dataview-search-input'
    element :search_button, 'button[id=dataview-search-button]'
    element :search_alert, '.alert-warning'

    elements :view, 'table tbody tr'
    element :delete_yes, '.modal-content button[data-bb-handler=success]' 
    

    def save(u)
        self.new_c.click
        self.name.set u.nome
        self.phone.set u.telefone
        self.email.set u.email
        self.type.find('option', text: u.tipo).select_option
        self.notes.set u.obs
        self.save_b.click
    end

end