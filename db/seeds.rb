FinanceTransactionCategory.find_or_create_by_name(:name=>"Library",:is_income=>true,:description=>"Library Module for Fedena")
Privilege.find_or_create_by_name :name => "Librarian",:description=>"librarian_privilege"
Tag.find_or_create_by_name(:name=>"Reference Book")