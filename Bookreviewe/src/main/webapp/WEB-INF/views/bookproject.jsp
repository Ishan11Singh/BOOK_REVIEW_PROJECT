<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import= "java.sql.PreparedStatement" %>
<%@ page import= "java.sql.ResultSet" %>
<%@ page import= "java.sql.SQLException" %>
<%@ page import= "java.sql.Statement" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Book Review Site</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="/src/main/webapp/WEB-INF/css/style.css">
    <style>
    body {
    font-family: Arial, sans-serif;
 
  }
  
  header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: #eee;
  }
  
  header h1 {
    margin: 0;
  }
  
  nav ul {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 0;
  }
  
  nav a {
    display: block;
    padding: 10px 20px;
    color: #333;
    text-decoration: none;
  }
  
  main {
    padding: 20px;
  }
  
  .book {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
  }
  

    .book img {
        width: 100px;
        height: 150px;
        margin-right: 20px;
      }
      
      .book h3 {
        margin: 0;
      }
      
      .book p {
        margin: 0;
        font-size: 14px;
        color: #666;
      }
      
      .reviews {
        list-style: none;
        padding: 0;
        margin-right: 30%;
      }
      
      .reviews li {
        padding: 20px;
        background-color: #fafafa;
        margin-bottom: 20px;
      }
      
      .rating {
        font-weight: bold;
      }
      
      .upvote {
        background-color: #3399ff;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 30%;
      }
      
      form {
        margin-top: 20px;
      }
      
      textarea,
      select,
      button {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        margin-bottom: 20px;
        box-sizing: border-box;
      }
      
      textarea {
        height: 200px;
      }
      
      footer {
        background-color: #eee;
        padding: 20px;
        text-align: center;
      }
      .book-content{
        width: 60%;
        margin: auto;
      }
      .bookauthor{
        padding: 2%;
      }
      .book-rating{
        width: 30%;
        margin-right:auto ;
      }
      .pagination{
        justify-content: center;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Book Review Site</h1>
      <nav>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Add Book</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <h2>Featured Book</h2>
      <div class="book">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS06R7UJcMbrTAzDuxsLdMdF-G5reJiw385qw&usqp=CAU" alt="Book Cover">
        <h3>Tempest :</h3>
        <p class="bookauthor">William Shakespeare </p>
        <p class="book-content">William Shakespeare (baptised 26 April 1564 – 23 April 1616) was an English poet and playwright, widely regarded as the greatest writer in the English language and the world’s pre-eminent dramatist. He is often called England’s national poet and the “Bard of Avon” (or simply “The Bard”). His surviving works consist of 38 plays, 154 sonnets, two long narrative poems, and several other poems. His plays have been translated into every major living language, and are performed more often than those of any other playwright.</p>
        <a  href="https://www.amazon.in/" ><button type="button" class="btn btn-outline-danger mx-3 btn-sm" >Buy on Amazon</button></a>
      </div>
      <h2>Book Reviews</h2>
      <ul class="reviews ">
        <li>
          <a name="showreview">
			<%
			Connection con= DriverManager.getConnection
					("jdbc:mysql://localhost:3306/bookproject", "root", "fiend");
			try {
			Statement stmt = con.createStatement();
			String sql = "select * from book1;";
			ResultSet rs = con.createStatement().executeQuery(sql);
			while(rs.next()) {
				out.println(rs.getString(1)+ "\n" +rs.getString(5)+"\n"+rs.getString(6));%>
				<br><% 
				out.println();
				
			}}	catch(SQLException e){
			e.printStackTrace();
			}
		finally {
			try {
			con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			}
			%>
			</a>
          
        </li>
        <!-- more reviews -->
      </ul>
      <h2>Write a Review</h2>
      <form action="http://localhost:8080/Book/reviewservlet" method=get class="book-rating">
      
      <div class="input-group flex-nowrap my-3">
  <span class="input-group-text" id="addon-wrapping">username</span>
  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" name="username">
</div>
        <textarea name="review"></textarea>
        <label for="rating">Rating:</label>
   <select name="rating">
          <option value="1" name="vote">1</option>
          <option value="2" name="vote">2</option>
          <option value="3" name="vote">3</option>
          <option value="4" name="vote">4</option>
          <option value="5" name="vote">5</option>
        </select>
        <button type="submit" class="btn btn-outline-primary">Submit</button>
      </form>
      <br>
      
    </main>
    <footer>
      <p>&copy; 2023 Book Review Site</p>
    </footer>
    <script src="/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
</html>
