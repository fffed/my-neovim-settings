import React from 'react';
import PropTypes from 'prop-types';
import styled from '@emotion/styled';


const RestStyled = styled.div`
    display: flex;
`;

test.propTypes = {
    children: PropTypes.node,
};

export default function test({ children }) {
    return (
        <RestStyled>
            { children }
        </RestStyled>
    );
}

