class AddRef < ActiveRecord::Migration[5.1]
  def change
    add_reference :people, :institution, foreign_key: true
    add_reference :lifts, :institution, foreign_key: true
    add_reference :groups, :institution, foreign_key: true
    add_reference :businfos, :institution, foreign_key: true
    add_reference :students, :lifts, foreign_key: true
    add_reference :lifts, :teacher, foreign_key: true
    add_reference :lifts, :driver, foreign_key: true
    add_reference :lifts, :businfo, foreign_key: true
    add_reference :students, :parent, foreign_key: true
    add_reference :students, :group, foreign_key: true
    add_reference :students, :person, foreign_key: true
    add_reference :drivers, :person, foreign_key: true
    add_reference :parents, :person, foreign_key: true
    add_reference :teachers, :person, foreign_key: true

  end
end
