<% provide(:title, 'Edit user') %>
<% provide(:button_text, 'Save changes') %>
<h1>Обновить профиль</h1>

<div class="row">
  <div class="col-md-6 col-md-offset-3">
    <%= form_for(@user) do |f| %>
      <%= render 'shared/error_messages' %>

      <%= f.label :first_name %>
      <%= f.text_field :first_name, class: 'form-control' %>

      <%= f.label :last_name %>
      <%= f.text_field :last_name, class: 'form-control' %>

      <%= f.label :email %>
      <%= f.email_field :email, class: 'form-control' %>

      <%= f.label :password %>
      <%= f.password_field :password, class: 'form-control' %>

      <%= f.label :password_confirmation, "Confirmation" %>
      <%= f.password_field :password_confirmation, class: 'form-control' %>

      <%= f.submit "Сохранить изменения", class: "btn btn-primary" %>
    <% end %>

    
  </div>
</div>