import React from 'react';

function Wrapper(props) {
    const style = {
        backgroundColor: 'yellow',
      };
    
    return (
        <div style={style}>
            {props.children}
        </div>
    );
}

export default Wrapper;