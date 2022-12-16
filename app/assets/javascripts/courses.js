const goToCenterCourses = (id) =>  {
  let url = window.location.href.split("?")[0]
  let urlParams = window.location.href.split("?")[1]
  const coursesRoute = '/courses/';
  const splitUrl = url.split(coursesRoute);
  console.log(url);
  console.log(splitUrl);
  const finalUrl = `${splitUrl[0]}${coursesRoute}${id}?${urlParams}`;
  window.location.href = finalUrl;
}