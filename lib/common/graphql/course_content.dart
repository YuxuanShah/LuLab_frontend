//课程数据请求
const String gqlCourseList = r'''
  query{
  latestCourse (option:{limit:4,skip:0}){
    _id
    title
    classTags
    description
    author
    authorTags
    category
    mode
    videoUrl
    duration
  }
}
''';
