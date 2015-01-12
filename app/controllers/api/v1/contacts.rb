module API
  module V1
    class Contacts < Grape::API
      include API::V1::Defaults

      resource :contacts do
        desc "Return all contacts"
        get "", root: :contacts do
          Contact.all
        end

        desc "Return a contact"
        params do
          requires :id, type: String, desc: "ID of the contact"
        end
        get ":id", root: :contact do
          Contact.find(permitted_params[:id])
        end

        desc "Create a contact"
        params do
          requires :contact, type: Hash do
            requires :first_name, type: String, desc: "First name of contact"
            requires :last_name, type: String, desc: "Last name of contact"
            requires :email, type: String, desc: "Email of contact"
            requires :title, type: String, desc: "Title of contact"
          end
        end
        post "", root: :contacts do
          Contact.create!(permitted_params)
        end

        desc "Update a contact's attributes"
        params do
          requires :id, type: String, desc: "ID of the contact"
          requires :contact, type: Hash do
            optional :first_name, type: String, desc: "First name of contact"
            optional :last_name, type: String, desc: "Last name of contact"
            optional :email, type: String, desc: "Email of contact"
            optional :title, type: String, desc: "Title of contact"
          end
        end
        put ":id", root: :contact do
          contact = Contact.find(permitted_params[:id])
          contact.update_attributes! permitted_params[:contact]
          contact
        end

      end
    end
  end
end
