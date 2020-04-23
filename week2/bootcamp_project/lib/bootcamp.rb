class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, k| hash[k] = [] }
  end
  
  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(tName)
    @teachers << tName
  end

  def enroll(sName)
    if @students.length < @student_capacity
        @students << sName
        return true
    else
        return false
    end
  end

  def enrolled?(sName)
    @students.include?(sName)
  end 

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(sName, gd)
    if enrolled?(sName)
        @grades[sName] << gd
        return true
    else
        return false
    end
  end 

  def num_grades(sName)
    @grades[sName].length
  end

  def average_grade(sName)
    if !enrolled?(sName) || @grades[sName].length == 0
        return nil
    else
        return @grades[sName].sum / @grades[sName].length
    end 
  end




end

