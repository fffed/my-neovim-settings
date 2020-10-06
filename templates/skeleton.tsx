import React from 'react';
import styled from '@emotion/styled';


const ComponentStyled = styled.div`
    display: flex;
`;

type ComponentProps = {
    children: React.ReactNode;
};

export function Component({ children }: ComponentProps): JSX.Element {
    return (
        <ComponentStyled>
            { children }
        </ComponentStyled>
    );
}
