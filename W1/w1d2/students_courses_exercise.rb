class Student
  attr_accessor :first_name, :last_name, :courses
  
  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @name = @first_name + " " + @last_name
    @courses = []
  end

  def name
    "#{ @first_name } #{ @last_name }"
  end

  def courses
    @courses.each { |instance| puts instance.course_name }
  end

  def enroll(course)
    unless courses.empty?
      conflicts = @courses.any? { |instance| instance.conflicts_with?(course) }
    end
    
    unless conflicts
      @courses.push(course)
      course.add_student(self)
    end
  end
  
  def course_load
    #hash of departments with total credits
    course_load = {}
    @courses.each do |course| 
      if course_load.has_key?(course.department)
        course_load[course.department]+= course.num_credits
      else
        course_load[course.department]= course.num_credits
      end
    end
    course_load 
  end
end

class Course
  attr_accessor :course_name, :department, :num_credits, :days, :time_block
  
  def initialize(course_name, department, num_credits, time_block, days = {})
    @course_name = course_name
    @department = department
    @num_credits = num_credits
    @time_block = time_block
    @days = days
    @students = []
  end

  def students
    print @students
  end
  
  def add_student(name)
    @students << name
  end  
  
  def conflicts_with?(course_instance)
    conflict = false
    if self.time_block == course_instance.time_block && self.days.any? do 
      |indiv_days| 
      if course_instance.days.include?(indiv_days)
        conflict = true
      end
    end
  end
    conflict  
  end
  
end

a = Course.new("Physics","Engineering",3, 1, [:m, :t, :w])
b = Course.new("Dancing","Art",3, 1, [:th, :f] )
c = Course.new("Flying","Magic",3, 2, [:t, :f] )
d =  Course.new("Drinking", "Humor",3, 1, [:f] )
s_1 = Student.new("Tom", "Landry")