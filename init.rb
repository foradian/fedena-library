require 'translator'
require File.join(File.dirname(__FILE__), "lib", "fedena_library")
require 'acts_as_taggable'

FedenaPlugin.register = {
  :name=>"fedena_library",
  :description=>"Fedena Library Module",
  :auth_file=>"config/library_auth.rb",
  :more_menu=>{:title=>"library_text",:controller=>"library",:action=>"index",:target_id=>"more-parent"},
  :sub_menus=>[{:title=>"manage_books",:controller=>"books",:action=>"index",:target_id=>"fedena_library"},
    {:title=>"search_book_text",:controller=>"library",:action=>"search_book",:target_id=>"fedena_library"},
    {:title=>"return_book",:controller=>"book_movement",:action=>"return_book",:target_id=>"fedena_library"},
    {:title=>"issue_books",:controller=>"book_movement",:action=>"direct_issue_book",:target_id=>"fedena_library"},
    {:title=>"library_setting_text",:controller=>"library",:action=>"card_setting",:target_id=>"fedena_library"},
    {:title=>"movement_log_index",:controller=>"library",:action=>"movement_log",:target_id=>"fedena_library"},
    {:title=>"book_renewal",:controller=>"book_movement",:action=>"renewal",:target_id=>"fedena_library"}],
  :dashboard_menu=>{:title=>"library_text",:controller=>"library",:action=>"index",\
      :options=>{:class => "option_buttons", :id => "library_button", :title => "manage_library"}},
  :student_profile_more_menu=>{:title=>"library_text",\
      :destination=>{:controller=>"library",:action=>"student_library_details"}},
  :employee_profile_more_menu=>{:title=>"library_text",\
      :destination=>{:controller=>"library",:action=>"employee_library_details"}},
  :finance=>{:category_name=>"library",:destination=>{:controller=>"library",:action=>"library_report"}},
  :css_overrides=>[{:controller=>"user",:action=>"dashboard"}],
  :autosuggest_menuitems=>[
    {:menu_type => 'link' ,:label => "autosuggest_menu.library",:value =>{:controller => :library,:action => :index}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.add_books",:value =>{:controller => :books,:action => :new}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.search_book",:value =>{:controller => :library,:action => :search_book}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.detailed_book_search",:value =>{:controller => :library,:action => :detail_search}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.return_book",:value =>{:controller => :book_movement,:action => :return_book}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.issue_books",:value =>{:controller => :book_movement,:action => :direct_issue_book}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.library_setting",:value =>{:controller => :library,:action => :card_setting}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.book_movement_log",:value =>{:controller => :library,:action => :movement_log}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.book_renewal",:value =>{:controller => :book_movement,:action => :renewal}},
    {:menu_type => 'link' ,:label => "autosuggest_menu.manage_books",:value =>{:controller => :books,:action => :index}}
  ],
  :multischool_models=>%w{Book BookMovement BookReservation LibraryCardSetting Tag Tagging}
}

Dir[File.join("#{File.dirname(__FILE__)}/config/locales/*.yml")].each do |locale|
  I18n.load_path.unshift(locale)
end

