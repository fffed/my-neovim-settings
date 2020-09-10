import React from 'react';
import PropTypes from 'prop-types';
import styled from '@emotion/styled';


const ComponentStyled = styled.div`
    display: flex;
`;

Component.propTypes = {
    children: PropTypes.node,
};

export default function Component({ children }) {
    return (
        <ComponentStyled>
            { children }
        </ComponentStyled>
    );
}
