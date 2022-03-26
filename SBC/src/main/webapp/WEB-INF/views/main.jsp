<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--@ taglib prefix="form" uri="http://www.springframework.org/tags/form"--%>
<!-- 절대 경로 지정해주기.  -->
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SBC MAIN</title>
<!-- Bootstrap core CSS -->
<link href="${root }css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Custom styles for this template -->
<link href="${root }css/style.css" rel="stylesheet">

<title>MainTest</title>
<!-- header -->
<c:import url='/WEB-INF/views/include/header_menu2.jsp' />

</head>

<body id="page-top">

	<!-- 여기서부터 진짜 body -->
	<section id="portfolio">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Our Works</h2>
						<p>Our portfolio is the best way to show our work, you can see
							here a big range of our work. Check them all and you will find
							what you are looking for.</p>
					</div>
				</div>
			</div>
			<div class="row row-0-gutter">
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog1.JPG" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Dean & Letter</h2>
								<p>Branding, Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-1">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog2.jpg" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Startup Framework</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-2">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
			<div class="row row-0-gutter">
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog3.JPG" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Lamp & Velvet</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-3">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog4.JPG" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Smart Name</h2>
								<p>Branding, Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-4">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
			<div class="row row-0-gutter">
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog5.JPG" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Fast People</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-5">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
				<!-- start portfolio item -->
				<div class="col-md-6 col-0-gutter">
					<div class="ot-portfolio-item">
						<figure class="effect-bubba">
							<img src="../images/demo/dog6.jpg" alt="img02"
								class="img-responsive" />
							<figcaption>
								<h2>Kites & Stars</h2>
								<p>Branding, Web Design</p>
								<a href="#" data-toggle="modal" data-target="#Modal-2">View
									more</a>
							</figcaption>
						</figure>
					</div>
				</div>
				<!-- end portfolio item -->
			</div>
		</div>
		<!-- container -->
	</section>

	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Our Team</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-2.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>Hyangwon Lee</h3>
							<div class="team-position">CEO & Web Design</div>
							<p>Mida sit una namet, cons uectetur adipiscing adon elit.
								Aliquam vitae barasa droma.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-6.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>KyungChul Lee</h3>
							<div class="team-position">Photography</div>
							<p>Worsa dona namet, cons uectetur dipiscing adon elit.
								Aliquam vitae fringilla unda mir.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<!-- team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>Minjoo Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>DongHyun Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-4.jpg" class="img-responsive"
								alt="author">
						</div>
						<div class="team-text">
							<h3>SeungE Kim</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>
				<!-- end team member item -->
				<div class="col-md-4">
					<div class="team-item">
						<div class="team-image">
							<img src="../images/demo/author-4.jpg" class="img-responsive"
								alt="author" style="margin: auto;">
						</div>
						<div class="team-text">
							<h3>Yujin Jeong</h3>
							<div class="team-position">Marketing</div>
							<p>Dolor sit don namet, cons uectetur beriscing adon elit.
								Aliquam vitae fringilla unda.</p>
						</div>
					</div>
				</div>

				<!-- end team member item
<div class="col-md-4 center">
<div class="team-item">
<div class="team-image">
<img src="../images/demo/author-4.jpg" class="img-responsive"
alt="author">
</div>
<div class="team-text">
<h3>Jae-hwan Do</h3>
<div class="team-position">Marketing</div>
<p>Dolor sit don namet, cons uectetur beriscing adon elit.
Aliquam vitae fringilla unda.</p>
</div>
</div>
</div>
<!-- end team member item
<div class="col-md-4 center">
<div class="team-item">
<div class="team-image">
<img src="../images/demo/author-4.jpg" class="img-responsive"
alt="author">
</div>
<div class="team-text">
<h3>Kyuri Teacher</h3>
<div class="team-position">Master</div>
<p>Dolor sit don namet, cons uectetur beriscing adon elit.
Aliquam vitae fringilla unda.</p>
</div>
</div>
</div>
<!-- end team member item
<div class="col-md-4 center">
<div class="team-item">
<div class="team-image">
<img src="../images/demo/cutedog.jpg" class="img-responsive"
alt="author">
</div>
<div class="team-text">
<h3>Baekseol Choi</h3>
<div class="team-position">Cute & Lovely</div>
<p>Dolor sit don namet, cons uectetur beriscing adon elit.
Aliquam vitae fringilla unda.</p>
</div>
</div>
</div>
-->
			</div>
		</div>
	</section>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="section-title">
						<h2>Contact Us</h2>
						<p>
							If you have some Questions or need Help! Please Contact Us!<br>We
							make Cool and Clean Design for your Business
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 text-center">
					<form name="sentMessage" id="contactForm" novalidate="">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="Your Name *" id="name" required=""
										data-validation-required-message="Please enter your name.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Your Email *" id="email" required=""
										data-validation-required-message="Please enter your email address.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control" placeholder="Your Message *"
										id="message" required=""
										data-validation-required-message="Please enter a message."></textarea>
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="row">
							<div class="col-lg-12 text-center">
								<div id="success"></div>
								<button type="submit" class="btn">Send Message</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<p id="back-top">
		<a href="#top"><i class="fa fa-angle-up"></i></a>
	</p>

	<!-- 포트폴리오 -->
	<!-- 모달창 -->
	<!-- Modal for portfolio item 1 -->
	<div class="modal fade" id="Modal-1" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-1">Dean & Letter</h4>
				</div>
				<div class="modal-body">
					<img src="../images/demo/portfolio-1.jpg" alt="img01"
						class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 2 -->
	<div class="modal fade" id="Modal-2" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-2">Startup Framework</h4>
				</div>
				<div class="modal-body">
					<img src="../images/demo/portfolio-2.jpg" alt="img01"
						class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 3 -->
	<div class="modal fade" id="Modal-3" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-3">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-3">Lamp & Velvet</h4>
				</div>
				<div class="modal-body">
					<img src="../images/demo/portfolio-3.jpg" alt="img01"
						class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 4 -->
	<div class="modal fade" id="Modal-4" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-4">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-4">Smart Name</h4>
				</div>
				<div class="modal-body">
					<img src="../images/demo/portfolio-4.jpg" alt="img01"
						class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for portfolio item 5 -->
	<div class="modal fade" id="Modal-5" tabindex="-1" role="dialog"
		aria-labelledby="Modal-label-5">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="Modal-label-5">Fast People</h4>
				</div>
				<div class="modal-body">
					<img src="../images/demo/portfolio-5.jpg" alt="img01"
						class="img-responsive" />
					<div class="modal-works">
						<span>Branding</span><span>Web Design</span>
					</div>
					<p>Temporibus autem quibusdam et aut officiis debitis aut rerum
						necessitatibus saepe</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer  -->
	<c:import url='/WEB-INF/views/include/footer_menu2.jsp' />

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="${root }js/SmoothScroll.js"></script>
	<script src="${root }js/theme-scripts.js"></script>

</body>
</html>
맨위로

