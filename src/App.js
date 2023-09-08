import React, { Component } from 'react'; // 리액트를 구현할 수 있는 플러그인을 연결
import Header from './components/Header';
import Main from './components/Main';
import Footer from './components/Footer';
import Wrapper from './components/Wrapper';

function App() {
  return (
    <div>
      <Header />
      <Wrapper>
        <Main name="1" color="blue"/>
        <Main name="2" color="black"/>
      </Wrapper>
      <Footer />
    </div>
  );
}

export default App;
