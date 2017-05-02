class Student
  attr_accessor :first_name, :last_name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def enroll(new_course)
    @courses.each do |course|
      if course.conflicts_with?(new_course)
        raise "Course conflicts with enrolled courses!"
      end
    end
    
    @courses << new_course unless @courses.include?(new_course)
    new_course.students << self
  end

  def course_load
    hsh = Hash.new(0)
    @courses.each do |course|
      hsh[course.department] += course.credits
    end
    hsh
  end
end
